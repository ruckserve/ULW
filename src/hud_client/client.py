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
        return self.session.get(fmr_base_url + "/listStates")

    def get_state_data(self, state_code):
        return self.session.get(fmr_base_url + "/statedata/" + state_code)
