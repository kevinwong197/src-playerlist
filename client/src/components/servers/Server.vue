<template>
    <b-card
      class="shadow"
      header-text-variant="white"
      border-variant="error"
      :header-bg-variant="server.dedicated ? 'primary' : 'secondary'"
      :title="server.name">

      <div slot="header">
        <b-btn
          :href="steamproto(server.addr)"
          :variant="server.dedicated ? 'success' : 'secondary'"
          :class="{disabled: !server.dedicated}">
          <small>{{server.dedicated ? '↪' : ''}} {{server.addr}}</small>
        </b-btn>
      </div>

      <p class="card-text">
        {{server.map}}
      </p>

      <div slot="footer">
        <b-btn size="sm" variant="primary" @click="select">
          show players <b-badge variant="light">{{server.players}}/{{server.max_players}}</b-badge>
        </b-btn>
        <players
          :addr="server.addr"
          class="mt-2"
          :class="selected ? null : 'collapse'"/>
      </div>
    </b-card>
</template>

<script>
import eventBus from '@/services/eventBus'
import Players from '@/components/Players'

export default {
  data () {
    return {
      selected: false
    }
  },
  props: ['server'],
  mounted () {
    eventBus.$on('deselect', (addr) => {
      this.deselect(addr)
    })
  },
  methods: {
    select () {
      this.selected = true
      eventBus.$emit('deselect', this.server.addr)
      eventBus.$emit('getplayers-'+this.server.addr)
    },
    deselect (addr) {
      if (addr === this.server.addr) {
        return
      }
      this.selected = false
    },
    unselected () {
      return !(this.selected)
    },
    steamproto (addr) {
      return 'steam://connect/' + addr
    }
  },
  components: {
    Players
  }
}
</script>

<style scoped>
.shadow {
  box-shadow: 0 20px 60px rgba(10, 10, 10, 0.05), 0 5px 10px rgba(10, 10, 10, 0.1), 0 1px 1px rgba(10, 10, 10, 0.2);
}
</style>
