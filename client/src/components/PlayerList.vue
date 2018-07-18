<template>
  <div class="mt-2 container py-md-4"
    v-bind:class="{'py-4': empty(), 'py-0': gotList()}">
    <div v-if="players.length > 0">
      <player v-for="(player, i) in players" v-bind:player="player" :key="i" />
    </div>
    <div v-else-if="empty()">Empty</div>
    <progress-bar v-else-if="loading()" />
    <spinner v-else-if="none()" />
    <div v-else>{{status}}</div>
  </div>
</template>

<script>
import Player from '@/components/PlayerList/Player.vue'
import Spinner from '@/components/Spinner.vue'
import ProgressBar from '@/components/ProgressBar.vue'
import playerQuery from '@/services/playerQuery.js'
import eventBus from '@/services/eventBus.js'

export default {
  data () {
    return {
      players: [],
      status: ''
    }
  },
  components: {
    Player,
    Spinner,
    ProgressBar
  },
  mounted () {
    eventBus.$on('getplayers', ipport => {
      this.getplayers(ipport)
    })
    eventBus.$on('resetplayers', () => {
      this.players = []
      this.status = ''
    })
  },
  methods: {
    getplayers (ipport) {
      this.players = []
      this.status = 'Loading'
      playerQuery.search(ipport).then(response => {
        console.log(response.data)
        this.status = response.data.status
        if (this.status === 'OK') {
          this.players = response.data.players
        }
      }, err => {
        console.log(err)
        this.status = 'client error'
      })
    },
    gotList () {
      return this.status === 'OK' && this.players.length > 0
    },
    empty () {
      return this.status === 'OK' && this.players.length <= 0
    },
    loading () {
      return this.status === 'Loading'
    },
    none () {
      return this.status === ''
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
