# Server

pwd : Pp1zmzsQSg5YCWvD
uri : mongodb+srv://karlbifubifu9:Pp1zmzsQSg5YCWvD@cluster0.pvsb3.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
## Setup
Running the server:
```
npm i
npx prisma generate
npm run app
```

### PostgreSQL Google CloudSQL
To connect to database with CLI terminal:

```
psql "sslmode=disable dbname=transactions_db user=postgres host=localhost"
```
prompted with password
aginet

Ensure .env file is properly configured:
```
DATABASE_URL="postgresql://postgres:aginet@localhost:5432/transactions_db?schema=public"
```
https://dashboard.stripe.com/b/acct_1QT8VR09VPA7czda
### Prisma ORM
Guide for syntax:
https://www.prisma.io/docs/concepts/components/prisma-client

- example code in controller/authController.js: under testCreateUser function

To update schema:
1. update table using CLI
    - update table using CLI with appropriate psql commands
    - do `npx prisma db pull` to auto-update prisma/schema.prisma file
    - `npx prisma generate`

2. update schema.prisma file
    - update in .prisma file
    - do `npx prisma db push` to update tables in db
    - warning pop up just ignore and type `y`
    - if any error pop up, probably due to constraints
    - `npx prisma generate`