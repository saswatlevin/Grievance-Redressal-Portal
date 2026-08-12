-- CreateEnum
CREATE TYPE "post_status_enum" AS ENUM ('open', 'locked', 'resolved', 'suspended', 'archived');

-- CreateEnum
CREATE TYPE "user_role_enum" AS ENUM ('company_employee', 'company_manager', 'restaurant_employee', 'restaurant_manager');

-- CreateEnum
CREATE TYPE "user_status_enum" AS ENUM ('active', 'suspended');

-- CreateTable
CREATE TABLE "posts" (
    "post_id" BIGSERIAL NOT NULL,
    "post_date_created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "post_content" VARCHAR(20000) NOT NULL,
    "user_id" BIGINT NOT NULL,
    "post_status" "post_status_enum" NOT NULL DEFAULT 'open',

    CONSTRAINT "posts_pkey" PRIMARY KEY ("post_id")
);

-- CreateTable
CREATE TABLE "images" (
    "image_id" BIGSERIAL NOT NULL,
    "image_date_created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "image_path" VARCHAR(256) NOT NULL,
    "image_tag" VARCHAR(1000),
    "post_id" BIGINT NOT NULL,

    CONSTRAINT "images_pkey" PRIMARY KEY ("image_id")
);

-- CreateTable
CREATE TABLE "comments" (
    "comment_id" BIGSERIAL NOT NULL,
    "comment_date_created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "comment_content" VARCHAR(20000) NOT NULL,
    "comment_is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "post_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "reply_id" BIGINT,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id")
);

-- CreateTable
CREATE TABLE "users" (
    "user_id" BIGSERIAL NOT NULL,
    "user_date_created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_first_name" VARCHAR(100) NOT NULL,
    "user_last_name" VARCHAR(100),
    "user_password" VARCHAR(100) NOT NULL,
    "user_email" VARCHAR(100) NOT NULL,
    "user_dob" DATE NOT NULL,
    "user_role" "user_role_enum" NOT NULL,
    "user_address_room_no" VARCHAR(5),
    "user_address_building" VARCHAR(50),
    "user_address_street" VARCHAR(100) NOT NULL,
    "user_address_city" VARCHAR(100) NOT NULL,
    "user_address_admin_division" VARCHAR(100),
    "user_address_country" VARCHAR(100) NOT NULL,
    "user_address_post_code" VARCHAR(12) NOT NULL,
    "outlet_id" BIGINT,
    "user_mobile_no" VARCHAR(12) NOT NULL,
    "user_is_moderator" BOOLEAN NOT NULL DEFAULT false,
    "user_status" "user_status_enum" NOT NULL DEFAULT 'active',

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "chains" (
    "chain_id" BIGSERIAL NOT NULL,
    "chain_date_created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "chain_name" VARCHAR(100) NOT NULL,
    "chain_headquarters_address_room_no" VARCHAR(5),
    "chain_headquarters_address_building" VARCHAR(50),
    "chain_headquarters_address_street" VARCHAR(100) NOT NULL,
    "chain_headquarters_address_city" VARCHAR(100) NOT NULL,
    "chain_headquarters_address_admin_division" VARCHAR(100),
    "chain_headquarters_address_country" VARCHAR(100) NOT NULL,
    "chain_headquarters_address_post_code" VARCHAR(12) NOT NULL,

    CONSTRAINT "chains_pkey" PRIMARY KEY ("chain_id")
);

-- CreateTable
CREATE TABLE "outlets" (
    "outlet_id" BIGSERIAL NOT NULL,
    "outlet_date_created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "outlet_name" VARCHAR(100) NOT NULL,
    "outlet_address_room_no" VARCHAR(5),
    "outlet_address_building" VARCHAR(50),
    "outlet_address_street" VARCHAR(100) NOT NULL,
    "outlet_address_city" VARCHAR(100) NOT NULL,
    "outlet_address_admin_division" VARCHAR(100),
    "outlet_address_country" VARCHAR(100) NOT NULL,
    "outlet_address_post_code" VARCHAR(12) NOT NULL,
    "chain_id" BIGINT,

    CONSTRAINT "outlets_pkey" PRIMARY KEY ("outlet_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_user_email_key" ON "users"("user_email");

-- CreateIndex
CREATE UNIQUE INDEX "users_user_mobile_no_key" ON "users"("user_mobile_no");

-- CreateIndex
CREATE UNIQUE INDEX "chains_chain_name_key" ON "chains"("chain_name");

-- CreateIndex
CREATE UNIQUE INDEX "outlets_outlet_name_key" ON "outlets"("outlet_name");

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
