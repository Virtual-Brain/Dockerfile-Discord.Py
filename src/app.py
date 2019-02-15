import discord
import asyncio

class MyBot(discord.Client):

    async def on_ready(self):
        print('Logged in as')
        print(self.user.name)
        print(self.user.id)
        print('------')

    async def on_message(self, message):
        if message.author.id == self.user.id:
            return

        if message.content.startswith('!test'):
            await message.channel.send('Receveid!')

client = MyBot()
client.run('your-token')
