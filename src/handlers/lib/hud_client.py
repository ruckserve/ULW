import requests


class HUDClient():
    fmr_base_url = "https://www.huduser.gov/hudapi/public/fmr"

    def __init__(self, token):
        self.session = self._create_authenticated_session(token)

    def _create_authenticated_session(self, token):
        session = requests.Session()
        session.headers.update({"Authorization": "Bearer " + token})
        return session

    def get_states(self):
        response = self.session.get(self.fmr_base_url + "/listStates")
        return response.json()

    def get_state_data(self, state_code):
        response = self.session.get(
            self.fmr_base_url + "/statedata/" + state_code)
        return response.json()
