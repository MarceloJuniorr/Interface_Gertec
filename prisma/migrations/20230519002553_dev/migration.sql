/*
  Warnings:

  - You are about to alter the column `promo_end` on the `products` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `promo_start` on the `products` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `products` MODIFY `promo_end` DATETIME NULL,
    MODIFY `promo_start` DATETIME NULL;
