-- CreateEnum
CREATE TYPE "TransactionType" AS ENUM ('TOPUP', 'WITHDRAWAL', 'ONLINETRANSFER');

-- CreateTable
CREATE TABLE "accounts" (
    "id" SERIAL NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "is_loggedin" BOOLEAN DEFAULT true,
    "online_balance" DECIMAL DEFAULT 0,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "otp" (
    "id" SERIAL NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "otp" INTEGER NOT NULL,
    "created_on" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "otp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transactions" (
    "id" SERIAL NOT NULL,
    "from_user" INTEGER NOT NULL,
    "to_user" INTEGER NOT NULL,
    "type" "TransactionType" NOT NULL,
    "value" DECIMAL NOT NULL,
    "transaction_on" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "accounts_phone_number_key" ON "accounts"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "accounts_username_key" ON "accounts"("username");

-- CreateIndex
CREATE UNIQUE INDEX "otp_phone_number_key" ON "otp"("phone_number");

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_from_user_fkey" FOREIGN KEY ("from_user") REFERENCES "accounts"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_to_user_fkey" FOREIGN KEY ("to_user") REFERENCES "accounts"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
