import axios from 'axios'

const service = {
  search (game) {
    let searchUrl = process.env.API_URL + 'servers/' + game
    let config = {}
    return axios.get(searchUrl, config)
  }
}

export default service
