/*
  Warnings:

  - You are about to drop the column `from_account` on the `transfers` table. All the data in the column will be lost.
  - You are about to drop the column `to_account` on the `transfers` table. All the data in the column will be lost.
  - Made the column `address` on table `customers` required. This step will fail if there are existing NULL values in that column.
  - Made the column `phone` on table `customers` required. This step will fail if there are existing NULL values in that column.
  - Made the column `email` on table `customers` required. This step will fail if there are existing NULL values in that column.
  - Made the column `current_balance` on table `customers` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `date` to the `transfers` table without a default value. This is not possible if the table is not empty.
  - Added the required column `from_customer` to the `transfers` table without a default value. This is not possible if the table is not empty.
  - Added the required column `time` to the `transfers` table without a default value. This is not possible if the table is not empty.
  - Added the required column `to_customer` to the `transfers` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "customers" ALTER COLUMN "address" SET NOT NULL,
ALTER COLUMN "phone" SET NOT NULL,
ALTER COLUMN "email" SET NOT NULL,
ALTER COLUMN "current_balance" SET NOT NULL;

-- AlterTable
ALTER TABLE "transfers" DROP COLUMN "from_account",
DROP COLUMN "to_account",
ADD COLUMN     "date" DATE NOT NULL,
ADD COLUMN     "from_customer" INTEGER NOT NULL,
ADD COLUMN     "time" TIME(0) NOT NULL,
ADD COLUMN     "to_customer" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "transfers" ADD FOREIGN KEY ("from_customer") REFERENCES "customers"("account_num") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transfers" ADD FOREIGN KEY ("to_customer") REFERENCES "customers"("account_num") ON DELETE CASCADE ON UPDATE CASCADE;

-- AlterIndex
ALTER INDEX "customers_email_key" RENAME TO "customers.email_unique";

-- AlterIndex
ALTER INDEX "customers_phone_key" RENAME TO "customers.phone_unique";
