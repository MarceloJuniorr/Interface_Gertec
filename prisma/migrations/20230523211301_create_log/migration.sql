/*
  Warnings:

  - You are about to alter the column `promo_end` on the `products` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `promo_start` on the `products` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `products` MODIFY `promo_end` DATETIME NULL,
    MODIFY `promo_start` DATETIME NULL;

-- CreateTable
CREATE TABLE `interface_log` (
    `id` VARCHAR(191) NOT NULL,
    `barcode` VARCHAR(191) NOT NULL,
    `log` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `interface_log_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
