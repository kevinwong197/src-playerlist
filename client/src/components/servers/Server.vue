<template>
    <b-card
      class="nohighlight"
      @click="select"
      :bg-variant="selected ? 'dark' : null">

      <div class="row">

        <div class="col-md-12 text-left">
          <h4
            :class="selected ? 'selected' : 'unselected'">
            {{server.name}}
          </h4>
        </div>
        <div class="col-md-auto d-none d-md-inline cntdesktop">
          <b-badge
            class="w-100"
            :variant="selected ? 'light' : 'dark'">
            {{server.players}}/{{server.max_players}}
          </b-badge>
        </div>
        <div class="col-6 d-none d-md-flex col-md">
          {{server.map}}
        </div>
        <div class="col-md-auto d-none d-md-inline addr" @click.stop>
          <b-btn
            class="w-100 addrdesktop py-0"
            size="sm"
            :href="steamproto(server.addr)"
            :variant="server.dedicated ? 'primary' : 'secondary'"
            :class="{disabled: !server.dedicated}">
            {{server.dedicated ? '↪' : ''}}{{server.addr}}
          </b-btn>
        </div>

        <div class="col-6 d-md-none text-left">
          {{server.map}}
        </div>
        <div class="col-6 d-md-none text-right">
          <b-badge
            :variant="selected ? 'light' : 'dark'">
            {{server.players}}/{{server.max_players}}
          </b-badge>
        </div>

      </div>

      <span v-if="selected" @click.stop>
        <players
          :addr="server.addr"
          :parent="$el"
          class="mt-2"/>
      </span>
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
  created () {
    eventBus.$on('deselect', this.deselect)
  },
  beforeDestroy(){
    eventBus.$off('deselect', this.deselect)
  },
  methods: {
    select () {
      if (this.selected) {
        eventBus.$emit('refreshplayers')
      } else {
        eventBus.$emit('deselect')
        this.selected = true
      }
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
  },
  components: {
    Players
  }
}
</script>

<style scoped>
.nohighlight {
  -moz-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  user-select: none;    
}
.selected {
  border-bottom-width: 2px;
  border-bottom-color: orange;
  border-bottom-style: solid;
}
.unselected {
  border-bottom-width: 2px;
  border-color: #007bff;
  border-bottom-style: solid;
}
.card-body {
  padding: 0.5rem;
}
.addrdesktop {
  max-width: 11rem;
  min-width: 11rem;
}
.cntdesktop {
  max-width: 5rem;
  min-width: 5rem;
}
</style>
