/*
  Warnings:

  - The primary key for the `chains` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `chain_id` on the `chains` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `comments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `comment_id` on the `comments` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `post_id` on the `comments` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `user_id` on the `comments` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `reply_id` on the `comments` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `images` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `image_id` on the `images` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `post_id` on the `images` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `outlets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `outlet_id` on the `outlets` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `chain_id` on the `outlets` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `posts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `post_id` on the `posts` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `user_id` on the `posts` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `user_id` on the `users` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - You are about to alter the column `outlet_id` on the `users` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.

*/
-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_post_id_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_reply_id_fkey";

-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_user_id_fkey";

-- DropForeignKey
ALTER TABLE "images" DROP CONSTRAINT "images_post_id_fkey";

-- DropForeignKey
ALTER TABLE "outlets" DROP CONSTRAINT "outlets_chain_id_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_user_id_fkey";

-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_outlet_id_fkey";

-- AlterTable
ALTER TABLE "chains" DROP CONSTRAINT "chains_pkey",
ALTER COLUMN "chain_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "chains_pkey" PRIMARY KEY ("chain_id");

-- AlterTable
ALTER TABLE "comments" DROP CONSTRAINT "comments_pkey",
ALTER COLUMN "comment_id" SET DATA TYPE INTEGER,
ALTER COLUMN "post_id" SET DATA TYPE INTEGER,
ALTER COLUMN "user_id" SET DATA TYPE INTEGER,
ALTER COLUMN "reply_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id");

-- AlterTable
ALTER TABLE "images" DROP CONSTRAINT "images_pkey",
ALTER COLUMN "image_id" SET DATA TYPE INTEGER,
ALTER COLUMN "post_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "images_pkey" PRIMARY KEY ("image_id");

-- AlterTable
ALTER TABLE "outlets" DROP CONSTRAINT "outlets_pkey",
ALTER COLUMN "outlet_id" SET DATA TYPE INTEGER,
ALTER COLUMN "chain_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "outlets_pkey" PRIMARY KEY ("outlet_id");

-- AlterTable
ALTER TABLE "posts" DROP CONSTRAINT "posts_pkey",
ALTER COLUMN "post_id" SET DATA TYPE INTEGER,
ALTER COLUMN "user_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "posts_pkey" PRIMARY KEY ("post_id");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
ALTER COLUMN "user_id" SET DATA TYPE INTEGER,
ALTER COLUMN "outlet_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("user_id");

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "images" ADD CONSTRAINT "images_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_reply_id_fkey" FOREIGN KEY ("reply_id") REFERENCES "comments"("comment_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_outlet_id_fkey" FOREIGN KEY ("outlet_id") REFERENCES "outlets"("outlet_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "outlets" ADD CONSTRAINT "outlets_chain_id_fkey" FOREIGN KEY ("chain_id") REFERENCES "chains"("chain_id") ON DELETE RESTRICT ON UPDATE CASCADE;
