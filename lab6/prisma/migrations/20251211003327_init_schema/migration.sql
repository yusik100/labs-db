-- CreateTable
CREATE TABLE "User" (
    "user_id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password_hash" VARCHAR(255) NOT NULL,
    "registration_date" DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "album" (
    "album_id" SERIAL NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "release_year" INTEGER NOT NULL,

    CONSTRAINT "album_pkey" PRIMARY KEY ("album_id")
);

-- CreateTable
CREATE TABLE "albumartist" (
    "album_id" INTEGER NOT NULL,
    "artist_id" INTEGER NOT NULL,

    CONSTRAINT "albumartist_pkey" PRIMARY KEY ("album_id","artist_id")
);

-- CreateTable
CREATE TABLE "artist" (
    "artist_id" SERIAL NOT NULL,
    "stage_name" VARCHAR(50) NOT NULL,
    "country" VARCHAR(50),
    "genre" VARCHAR(50),

    CONSTRAINT "artist_pkey" PRIMARY KEY ("artist_id")
);

-- CreateTable
CREATE TABLE "playlist" (
    "playlist_id" SERIAL NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "created_at" DATE NOT NULL DEFAULT CURRENT_DATE,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "playlist_pkey" PRIMARY KEY ("playlist_id")
);

-- CreateTable
CREATE TABLE "playlisttrack" (
    "playlist_id" INTEGER NOT NULL,
    "track_id" INTEGER NOT NULL,

    CONSTRAINT "playlisttrack_pkey" PRIMARY KEY ("playlist_id","track_id")
);

-- CreateTable
CREATE TABLE "subscription" (
    "subscription_id" SERIAL NOT NULL,
    "type_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "subscription_pkey" PRIMARY KEY ("subscription_id")
);

-- CreateTable
CREATE TABLE "subscriptiontype" (
    "type_id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "price" DECIMAL(6,2) NOT NULL,

    CONSTRAINT "subscriptiontype_pkey" PRIMARY KEY ("type_id")
);

-- CreateTable
CREATE TABLE "track" (
    "track_id" SERIAL NOT NULL,
    "title" VARCHAR(150) NOT NULL,
    "duration_seconds" INTEGER NOT NULL,
    "release_date" DATE NOT NULL,
    "album_id" INTEGER,

    CONSTRAINT "track_pkey" PRIMARY KEY ("track_id")
);

-- CreateTable
CREATE TABLE "trackartist" (
    "track_id" INTEGER NOT NULL,
    "artist_id" INTEGER NOT NULL,

    CONSTRAINT "trackartist_pkey" PRIMARY KEY ("track_id","artist_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "artist_stage_name_key" ON "artist"("stage_name");

-- CreateIndex
CREATE UNIQUE INDEX "subscriptiontype_name_key" ON "subscriptiontype"("name");

-- AddForeignKey
ALTER TABLE "albumartist" ADD CONSTRAINT "albumartist_album_id_fkey" FOREIGN KEY ("album_id") REFERENCES "album"("album_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "albumartist" ADD CONSTRAINT "albumartist_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "artist"("artist_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "playlist" ADD CONSTRAINT "playlist_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "playlisttrack" ADD CONSTRAINT "playlisttrack_playlist_id_fkey" FOREIGN KEY ("playlist_id") REFERENCES "playlist"("playlist_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "playlisttrack" ADD CONSTRAINT "playlisttrack_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "track"("track_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subscription" ADD CONSTRAINT "subscription_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "subscriptiontype"("type_id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subscription" ADD CONSTRAINT "subscription_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "track" ADD CONSTRAINT "track_album_id_fkey" FOREIGN KEY ("album_id") REFERENCES "album"("album_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "trackartist" ADD CONSTRAINT "trackartist_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "artist"("artist_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "trackartist" ADD CONSTRAINT "trackartist_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "track"("track_id") ON DELETE CASCADE ON UPDATE NO ACTION;
