-- CreateTable
CREATE TABLE "customers" (
    "account_num" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "address" VARCHAR(511),
    "phone" VARCHAR(255),
    "email" VARCHAR(255),
    "current_balance" MONEY,
    "country" VARCHAR(2) NOT NULL,

    CONSTRAINT "customers_pkey" PRIMARY KEY ("account_num")
);

-- CreateTable
CREATE TABLE "transfers" (
    "tranfer_id" SERIAL NOT NULL,
    "from_account" INTEGER NOT NULL,
    "to_account" INTEGER NOT NULL,
    "amount" MONEY NOT NULL,

    CONSTRAINT "transfers_pkey" PRIMARY KEY ("tranfer_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "customers_phone_key" ON "customers"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "customers_email_key" ON "customers"("email");
