<template>
    <b-card
      class="shadow"
      header-text-variant="white"
      border-variant="error"
      :header-bg-variant="server.dedicated ? 'primary' : 'secondary'"
      :title="server.name"
      @click="select">

      <div slot="header">
        <b-btn
          :href="steamproto(server.addr)"
          :variant="server.dedicated ? 'success' : 'secondary'"
          :class="{disabled: !server.dedicated}">
          {{server.dedicated ? 'connect' : 'local'}}
          <small>{{server.addr}}</small>
          <b-badge variant="light">{{server.players}}/{{server.max_players}}</b-badge>
        </b-btn>
      </div>

      <p class="card-text">
        {{server.map}}
      </p>

      <div class="desktop" slot="footer">
        <b-btn v-b-toggle="server.addr" size="sm">show players</b-btn>
        <b-collapse :id="server.addr" class="mt-2">
          <b-card>
            asdf!
          </b-card>
        </b-collapse>
      </div>
    </b-card>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      selected: false
    }
  },
  props: ['server'],
  mounted () {
    eventBus.$on('deselect', () => {
      this.deselect()
    })
  },
  methods: {
    select () {
      eventBus.$emit('getplayers', this.server.addr)
      eventBus.$emit('deselect')
      this.selected = true
    },
    deselect () {
      this.selected = false
    },
    unselected () {
      return !(this.selected)
    },
    steamproto (addr) {
      return 'steam://connect/' + addr
    }
  }
}
</script>

<style scoped>
.shadow {
  box-shadow: 0 20px 60px rgba(10, 10, 10, 0.05), 0 5px 10px rgba(10, 10, 10, 0.1), 0 1px 1px rgba(10, 10, 10, 0.2);
}
.name {
  text-align: center;
  font-size: 1rem;
}
.map {
  text-align: left;
  font-size: 0.8rem;
}
.players {
  text-align: right;
  font-size: 0.8rem;
}
.name, .map {
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
</style>
