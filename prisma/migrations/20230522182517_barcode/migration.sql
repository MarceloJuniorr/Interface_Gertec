/*
  Warnings:

  - You are about to alter the column `promo_end` on the `products` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `promo_start` on the `products` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - A unique constraint covering the columns `[barcode]` on the table `products` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `products` MODIFY `promo_end` DATETIME NULL,
    MODIFY `promo_start` DATETIME NULL;

-- CreateIndex
CREATE UNIQUE INDEX `products_barcode_key` ON `products`(`barcode`);
