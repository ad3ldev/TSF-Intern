![Svelte](https://img.shields.io/badge/svelte-%23f1413d.svg?style=for-the-badge&logo=svelte&logoColor=white)![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)![SASS](https://img.shields.io/badge/SASS-hotpink.svg?style=for-the-badge&logo=SASS&logoColor=white)![Vercel](https://img.shields.io/badge/vercel-%23000000.svg?style=for-the-badge&logo=vercel&logoColor=white)![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)![Prisma](https://img.shields.io/badge/Prisma-3982CE?style=for-the-badge&logo=Prisma&logoColor=white)

# Basic Banking System

[Live Website](https://tsf-intern.vercel.app)

A simple banking system, that only has 3 functions:

-   Show a table of customers.
-   Show a table of transfers that have been processed.
-   Be able to make transfers between customers.

## Application Structure

![App Structure](/app-structure.png)

## Technologies Used

### Framework

SvelteKit

### Front End

Sass (.scss files)

### Backend

Supabase as a PostgreSQL database and Depolyed to Vercel

### Middleware

Prisma to create the schema for SQL database.


Icons used from [icon8](https://icons8.com).

---

## Caveats

Unable to use prisma as my main database connection for fetching and updating data as I originally intended so I used the official Supabase API.
