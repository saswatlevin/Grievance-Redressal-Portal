/*
  Warnings:

  - You are about to drop the column `reply_id` on the `comments` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "comments" DROP CONSTRAINT "comments_reply_id_fkey";

-- DropIndex
DROP INDEX "comments_comment_id_reply_id_key";

-- AlterTable
ALTER TABLE "comments" DROP COLUMN "reply_id",
ADD COLUMN     "parent_comment_id" INTEGER;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_parent_comment_id_fkey" FOREIGN KEY ("parent_comment_id") REFERENCES "comments"("comment_id") ON DELETE SET NULL ON UPDATE CASCADE;
