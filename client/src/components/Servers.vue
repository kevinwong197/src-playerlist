<template>
  <div class="serverlist">
    <div class="container" v-if="filteredServers().length > 0">
      <div class="row">
        <div class="col">
          <server
            class="shad sharpbox clickable my-md-2"
            v-for="(server, i) in filteredServers()"
            :server="server"
            :key="i" />
        </div>
      </div>
    </div>
    <b-card v-else-if="ok()">No Results</b-card>
    <progress-bar class="sharpbox" v-else-if="loading()" />
    <b-card v-else>{{status}}</b-card>
  </div>
</template>

<script>
import Server from '@/components/servers/Server'
import ProgressBar from '@/components/ProgressBar'
import serverQuery from '@/services/serverQuery'
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      servers: [],
      status: 'Loading',
      game: '',
      map: '',
      name: '',
      local: false,
      empty: false
    }
  },
  components: {
    Server,
    ProgressBar
  },
  mounted () {
    eventBus.$on('getservers', () => {
      this.getservers()
    })
    eventBus.$on('updategame', (game) => {
      this.game = game
    })
    eventBus.$on('updatemap', (map) => {
      this.map = map
    })
    eventBus.$on('updatename', (name) => {
      this.name = name
    })
    eventBus.$on('updatelocal', (b) => {
      this.local = b
    })
    eventBus.$on('updateempty', (b) => {
      this.empty = b
    })
    this.init()
  },
  watch:{
    $route (to, from) {
      this.init()
    }
  },
  methods: {
    init () {
      let gamedir = this.$route.params.gamedir || 'synergy'
      let name = this.$route.params.name || this.$route.params.gamedir || 'synergy'
      eventBus.$emit('updategamelabel', name)
      eventBus.$emit('updategame', gamedir)
      eventBus.$emit('getservers')
    },
    getservers () {
      this.servers = []
      this.status = 'Loading'
      let game = this.game
      serverQuery.search(this.game).then(response => {
        console.log(response.data)
        if (this.game === game) {
          this.status = response.data.status
          if (this.status === 'OK') {
            this.servers = response.data.servers
          } else {
            this.status = response.data.status
          }
        }
      }, err => {
        console.log(err)
        if (this.game === game) {
          this.status = 'Client Error: ' + err.response.statusText
        }
      })
    },
    listNotExist () {
      return !(this.servers.length > 0)
    },
    listExist () {
      return (this.servers.length > 0)
    },
    ok () {
      return this.status === 'OK'
    },
    loading () {
      return this.status === 'Loading'
    },
    matchMap (server) {
      return this.map === '' ||
        server.map !== undefined &&
        server.map.includes(this.map)
    },
    matchName (server) {
      return this.name === '' ||
        server.name !== undefined &&
        server.name.includes(this.name)
    },
    matchEmpty (server) {
      return this.empty || server.players != 0
    },
    matchLocal (server) {
      return this.local || server.dedicated
    },
    filteredServers () {
      eventBus.$emit('deselect')
      return this.servers.filter(server => {
        return this.matchMap(server) &&
          this.matchName(server) &&
          this.matchEmpty(server) &&
          this.matchLocal(server)
      }).slice(0, 50)
    }
  }
}
</script>

<style scoped>
.sharpbox {
  border-radius: 0;
}
.clickable {
  cursor: pointer;
}
.clickable:hover {
  background-color: #DDDDDD;
}
@media (min-width: 768px) {
  .shad {
    box-shadow: 0 20px 60px rgba(10, 10, 10, 0.05), 0 5px 10px rgba(10, 10, 10, 0.1), 0 1px 1px rgba(10, 10, 10, 0.2);
  }
}
</style>
