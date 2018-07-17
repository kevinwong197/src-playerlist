import axios from 'axios'

const service = {
  search (ipport) {
    let searchUrl = process.env.API_URL + 'players/' + ipport
    let config = {}
    return axios.get(searchUrl, config)
  }
}

export default service
