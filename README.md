# NotionJournal

NotionJournal is a lightweight macOS status bar app for making quick notes into your Notion page.

<img width="907" alt="Снимок экрана 2021-07-24 в 12 11 29" src="https://user-images.githubusercontent.com/2261168/126863801-e433a605-409a-4697-b28d-c80a24559ad0.png">

The app itself in your status bar:

<img width="529" alt="Снимок экрана 2021-07-24 в 12 16 24" src="https://user-images.githubusercontent.com/2261168/126863969-006c80fc-5ca6-404e-87dc-9312e865e095.png">


To work it needs:
1) Your own Notion Integration and its "Integration Secret Key"
2) Page Id of your Notion page, where you want to push notes
3) Connect your integration with your page
4) Add your "Integration Secret Key" and Page Id to the app

## Steps to get the Notion Integration and the key
1. Go to https://www.notion.com/my-integrations
2. Click the "+ New integration" button
3. Give your integration a name - I chose "My Notion Journal Integration"
4. Select the workspace where you want to install this integration
5. Click "Submit" to create the integration
6. Copy the "Internal Integration Token" on the next page

## Steps to get your Notion page Id:
1. Go to your page in Notion
2. Click "Share"
3. Click "Copy Link". You'll get something like https://www.notion.so/MyJournal-e338cd6b693e4a70ab24170759a65578
4. Copy the last component, i.e. **e338cd6b693e4a70ab24170759a65578**

## Steps to connect your integration with your page
1. Go to your page in Notion
2. Click "Share"
3. Click "Invite" and invite your new integration

## Steps to add the key and page id to the app:
1. Go to the app settings (small gear at the top-right in main panel)
2. Paste "Integration Secret Key" and "Page Id"
3. Done!
