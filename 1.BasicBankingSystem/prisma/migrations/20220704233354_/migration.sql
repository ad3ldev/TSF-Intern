-- DropForeignKey
ALTER TABLE "transfers" DROP CONSTRAINT "transfers_from_customer_fkey";

-- DropForeignKey
ALTER TABLE "transfers" DROP CONSTRAINT "transfers_to_customer_fkey";

-- AddForeignKey
ALTER TABLE "transfers" ADD CONSTRAINT "transfers_from_customer_fkey" FOREIGN KEY ("from_customer") REFERENCES "customers"("account_num") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfers" ADD CONSTRAINT "transfers_to_customer_fkey" FOREIGN KEY ("to_customer") REFERENCES "customers"("account_num") ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER INDEX "customers.email_unique" RENAME TO "customers_email_key";

-- RenameIndex
ALTER INDEX "customers.phone_unique" RENAME TO "customers_phone_key";
