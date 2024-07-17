# Copy .env.example to .env
cp .env.example .env

# Add TMBd_API_KEY to .env (replace YOUR_API_KEY with your actual key)
sed -i 's/^TMBD_API_KEY=.*/TMBD_API_KEY=YOUR_API_KEY/' .env

# Install PHP dependencies
sed composer install
echo "Installing PHP dependencies..."

# Start Docker containers with Laravel Sail in detached mode
echo "Starting Laravel Sail containers..."
sail up -d

# Install npm dependencies
echo "Installing npm dependencies..."
sail npm install

# Compile assets with npm (development)
echo "Compiling assets for development..."
sail npm run dev

# Generate Laravel application key
echo "Generating Laravel application key..."
sail artisan key:generate

# Run database migrations
echo "Running database migrations..."
sail artisan migrate

# Populate the database with optional timeWindow argument (day or week)
echo "Populating the database..."
sail artisan database:populate --timeWindow=day

# Check for errors after each command
if [ $? -ne 0 ]; then
    echo "Error encountered. Exiting..."
    exit 1
fi

echo "Installation complete!"
