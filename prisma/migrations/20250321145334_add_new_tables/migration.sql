-- CreateTable
CREATE TABLE "User" (
    "_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "emailVerified" BOOLEAN NOT NULL DEFAULT false,
    "image" TEXT,
    "premium" BOOLEAN NOT NULL DEFAULT false,
    "role" TEXT NOT NULL DEFAULT 'user',
    "banned" BOOLEAN NOT NULL DEFAULT false,
    "banReason" TEXT,
    "banExpires" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "localGoogleId" TEXT,
    "googleResourceId" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "Session" (
    "_id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "impersonatedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "Account" (
    "_id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "accountId" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,
    "accessToken" TEXT,
    "refreshToken" TEXT,
    "accessTokenExpiresAt" TIMESTAMP(3),
    "refreshTokenExpiresAt" TIMESTAMP(3),
    "scope" TEXT,
    "password" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "Verification" (
    "_id" TEXT NOT NULL,
    "identifier" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Verification_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "LocalGoogleCredential" (
    "id" TEXT NOT NULL,
    "accessToken" TEXT NOT NULL,
    "folderId" TEXT,
    "pageToken" TEXT,
    "channelId" TEXT NOT NULL,
    "subscribed" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "LocalGoogleCredential_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiscordWebhook" (
    "id" TEXT NOT NULL,
    "webhookId" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "guildName" TEXT NOT NULL,
    "guildId" TEXT NOT NULL,
    "channelId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "DiscordWebhook_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Slack" (
    "id" TEXT NOT NULL,
    "appId" TEXT NOT NULL,
    "authedUserId" TEXT NOT NULL,
    "authedUserToken" TEXT NOT NULL,
    "slackAccessToken" TEXT NOT NULL,
    "botUserId" TEXT NOT NULL,
    "teamId" TEXT NOT NULL,
    "teamName" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Slack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notion" (
    "id" TEXT NOT NULL,
    "accessToken" TEXT NOT NULL,
    "workspaceId" TEXT NOT NULL,
    "databaseId" TEXT NOT NULL,
    "workspaceName" TEXT NOT NULL,
    "workspaceIcon" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Notion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Connections" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "discordWebhookId" TEXT,
    "notionId" TEXT,
    "userId" TEXT,
    "slackId" TEXT,

    CONSTRAINT "Connections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Workflows" (
    "id" TEXT NOT NULL,
    "nodes" TEXT,
    "edges" TEXT,
    "name" TEXT NOT NULL,
    "discordTemplate" TEXT,
    "notionTemplate" TEXT,
    "slackTemplate" TEXT,
    "slackChannels" TEXT[],
    "slackAccessToken" TEXT,
    "notionAccessToken" TEXT,
    "notionDbId" TEXT,
    "flowPath" TEXT,
    "cronPath" TEXT,
    "publish" BOOLEAN DEFAULT false,
    "description" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Workflows_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_localGoogleId_key" ON "User"("localGoogleId");

-- CreateIndex
CREATE UNIQUE INDEX "User_googleResourceId_key" ON "User"("googleResourceId");

-- CreateIndex
CREATE UNIQUE INDEX "LocalGoogleCredential_accessToken_key" ON "LocalGoogleCredential"("accessToken");

-- CreateIndex
CREATE UNIQUE INDEX "LocalGoogleCredential_channelId_key" ON "LocalGoogleCredential"("channelId");

-- CreateIndex
CREATE UNIQUE INDEX "LocalGoogleCredential_userId_key" ON "LocalGoogleCredential"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "DiscordWebhook_webhookId_key" ON "DiscordWebhook"("webhookId");

-- CreateIndex
CREATE UNIQUE INDEX "DiscordWebhook_url_key" ON "DiscordWebhook"("url");

-- CreateIndex
CREATE UNIQUE INDEX "DiscordWebhook_channelId_key" ON "DiscordWebhook"("channelId");

-- CreateIndex
CREATE UNIQUE INDEX "Slack_authedUserToken_key" ON "Slack"("authedUserToken");

-- CreateIndex
CREATE UNIQUE INDEX "Slack_slackAccessToken_key" ON "Slack"("slackAccessToken");

-- CreateIndex
CREATE UNIQUE INDEX "Notion_accessToken_key" ON "Notion"("accessToken");

-- CreateIndex
CREATE UNIQUE INDEX "Notion_workspaceId_key" ON "Notion"("workspaceId");

-- CreateIndex
CREATE UNIQUE INDEX "Notion_databaseId_key" ON "Notion"("databaseId");

-- CreateIndex
CREATE UNIQUE INDEX "Connections_type_key" ON "Connections"("type");

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocalGoogleCredential" ADD CONSTRAINT "LocalGoogleCredential_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DiscordWebhook" ADD CONSTRAINT "DiscordWebhook_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Slack" ADD CONSTRAINT "Slack_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notion" ADD CONSTRAINT "Notion_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Connections" ADD CONSTRAINT "Connections_discordWebhookId_fkey" FOREIGN KEY ("discordWebhookId") REFERENCES "DiscordWebhook"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Connections" ADD CONSTRAINT "Connections_notionId_fkey" FOREIGN KEY ("notionId") REFERENCES "Notion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Connections" ADD CONSTRAINT "Connections_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Connections" ADD CONSTRAINT "Connections_slackId_fkey" FOREIGN KEY ("slackId") REFERENCES "Slack"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Workflows" ADD CONSTRAINT "Workflows_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;
