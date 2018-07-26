import axios from 'axios'
import eventBus from '@/services/eventBus'

const service = {
  search (game) {
    let apicall = 'servers'
    let searchUrl = process.env.API_URL + apicall + '/' + game
    let config = {}
    return axios.get(searchUrl, config)
  }
}

export default service
