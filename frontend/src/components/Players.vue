<template>
  <div class="container text-center"
    :class="{'py-4': empty(), 'py-0': gotList()}">
    <div v-if="ok() && gotList()">
      <player v-for="(player, i) in players" :player="player" :key="i" />
    </div>
    <div v-else-if="ok()">Empty</div>
    <progress-bar v-else-if="loading()" />
    <spinner v-else-if="none()" />
    <div v-else-if="!ok()">{{status}}</div>
  </div>
</template>

<script>
import Player from '@/components/players/Player'
import Spinner from '@/components/Spinner'
import ProgressBar from '@/components/ProgressBar'
import playerQuery from '@/services/playerQuery'
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      players: [],
      status: ''
    }
  },
  components: {
    Player,
    ProgressBar,
    Spinner
  },
  created () {
    eventBus.$on('refreshplayers', this.getplayers)
    this.getplayers()
  },
  mounted () {
    this.parent.scrollIntoView({ 
      behavior: 'smooth',
      block: 'center',
      inline: 'center'
    });
  },
  beforeDestroy (){
    eventBus.$off('refreshplayers', this.getplayers)
  },
  props: ['addr', 'parent'],
  methods: {
    getplayers () {
      this.players = []
      this.status = 'Loading'
      playerQuery.search(this.addr).then(response => {
        console.log(response.data)
        this.status = response.data.status
        if (this.status === 'OK') {
          this.players = response.data.players
        }
      }, err => {
        console.log(err)
        this.status = 'Client Error: ' + err.response.statusText
      })
    },
    gotList () {
      return this.players.length > 0
    },
    empty () {
      return this.players.length <= 0
    },
    loading () {
      return this.status === 'Loading'
    },
    none () {
      return this.status === ''
    },
    ok () {
      return this.status === 'OK'
    }
  }
}
</script>

<style scoped>
.container {
  color: #66ccff;
}
.row:nth-last-child(n+2) {
  border-bottom-width: 1px;
  border-bottom-color: orange;
  border-bottom-style: dashed;
}
</style>
