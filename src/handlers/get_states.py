import os

from lib.hud_client import HUDClient


class GetStatesHandler():
    @staticmethod
    def create(token):
        client = HUDClient(token)
        return GetStatesHandler(client)

    def __init__(self, client):
        self.client = client

    def get_states(self):
        states = self.client.get_states()
        return sorted([state["state_code"] for state in states])


def get_state_handler(event, context):
    token = os.environ["HUD_TOKEN"]
    handler = GetStatesHandler.create(token)
    return handler.get_states()
