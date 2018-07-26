import axios from 'axios'

const service = {
  search (game, call) {
    let apicall = call
    let searchUrl = process.env.API_URL + apicall + '/' + game
    let config = {}
    return axios.get(searchUrl, config)
  }
}

export default service
