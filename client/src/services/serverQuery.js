import axios from 'axios'
import apiQuery from '@/services/apiQuery'

const service = {
  search (game) {
    return apiQuery.search(game, 'servers')
  }
}

export default service
