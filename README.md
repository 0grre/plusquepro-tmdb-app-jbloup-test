# TMDb Application 

## Installation Instructions

To install and set up the application using Laravel Sail, follow these steps:

1.	#### Clone the Repository:

```bash
git clone https://github.com/0grre/plusquepro-tmdb-app-jbloup-test.git
cd plusquepro-tmdb-app-jbloup-test
```
2.	#### Set Up Environment Variables:
Copy the .env.example file to .env:

```bash
cp .env.example .env
```

3.	#### Run the Installation Script:
Execute the **install.sh** script to automate the setup process:

```bash
chmod +x install.sh
./install.sh
```

This script will:

- Start Laravel Sail containers in detached mode.
- Install npm dependencies and compile assets for development.
- Generate a Laravel application key.
- Run database migrations.
- Populate the database with initial data using the `artisan database:populate` command.

	
4.	#### Customize Database Population (Optional):

The `artisan database:populate` command supports an optional time window argument:
-	**day**: Populate data relevant for the current day.
-	**week**: Populate data relevant for the current week.

Specify the desired time window according to your application’s needs.

Example:
```bash
sail artisan database:populate day
```

5.	#### Accessing Your Application:
Once the installation is complete, you can access your application at http://localhost.

##### PS: 
the credentials for the admin user are:
- email: admin@tmdb.app
- password: 1234qwer

in `.env.example`
```
BO_USER=admin@tmdb.app
BO_PASSWORD=1234qwer
```
