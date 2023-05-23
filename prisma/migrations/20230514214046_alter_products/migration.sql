/*
  Warnings:

  - Added the required column `price_promo` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `promo_active` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `promo_end` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `promo_start` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `products` ADD COLUMN `price_promo` DOUBLE NOT NULL,
    ADD COLUMN `promo_active` BOOLEAN NOT NULL,
    ADD COLUMN `promo_end` DATETIME NOT NULL,
    ADD COLUMN `promo_start` DATETIME NOT NULL;
