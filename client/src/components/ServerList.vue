<template>
  <div class="mt-2 container py-md-4"
    v-bind:class="{'py-4': listNotExist(), 'py-0': listExist()}">
    <div v-if="servers.length > 0">
      <server v-for="(server, i) in servers" v-bind:server="server" :key="i" />
    </div>
    <div v-else-if="ok()">Empty</div>
    <progress-bar v-else-if="loading()" />
    <div v-else>{{status}}</div>
  </div>
</template>

<script>
import Server from '@/components/ServerList/Server.vue'
import ProgressBar from '@/components/ProgressBar.vue'
import serverQuery from '@/services/serverQuery.js'
import eventBus from '@/services/eventBus.js'

export default {
  data () {
    return {
      servers: [],
      status: 'Loading',
      game: 'tf',
      map: ''
    }
  },
  components: {
    Server,
    ProgressBar
  },
  mounted () {
    eventBus.$on('getservers', () => {
      eventBus.$emit('resetplayers')
      this.getservers()
    })
    eventBus.$on('updategame', (game) => {
      this.game = game
    })
    eventBus.$on('updatemap', (map) => {
      this.map = map
    })
    this.getservers('synergy')
  },
  methods: {
    getservers () {
      this.servers = []
      this.status = 'Loading'
      serverQuery.search(this.game).then(response => {
        console.log(response.data)
        this.status = response.data.status
        if (this.status === 'OK') {
          this.servers = response.data.servers
        } else {
          this.status = response.data.status
        }
      }, err => {
        console.log(err)
        this.status = 'client error'
      })
    },
    listNotExist () {
      return !(this.servers.length > 0)
    },
    listExist () {
      return (this.servers.length > 0)
    },
    ok () {
      return status === 'OK'
    },
    loading () {
      return status === 'Loading'
    }
  }
}
</script>

<style scoped>
.container {
  background-color: #222222;
  color: #66ccff;
}
.row:nth-last-child(n+2) {
  border-bottom-width: 1px;
  border-bottom-color: #66ccff;
  border-bottom-style: solid;
}
@media (min-width: 768px) {
  .row:nth-last-child(n+2) {
    border-bottom-width: 0.1px;
  }
}
</style>
