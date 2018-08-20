import axios from 'axios'

const service = {
  search (game, call) {
    let searchUrl = process.env.API_URL + call + '/' + game
    let config = {}
    return axios.get(searchUrl, config)
  }
}

export default service
