<template>
    <b-card
      class="nohighlight"
      :class="selected ? 'dropped' : null"
      @click="select"
      :bg-variant="selected ? 'dark' : null">
<!-- justify-content-md-left -->




      <div class="row mb-0">
        <div class="col-6 col-md-auto d-md-none text-left">
          <small
            :class="selected ? 'text-white' : 'text-dark'"
            class="w-100 bg-transparent text-truncate border-0">
            {{server.map}}
          </small>
        </div>
        <div class="col-6 d-md-none text-right">
          <small
            :class="selected ? 'text-white' : 'text-dark'"
            class="w-100 bg-transparent border-0 text-white">
            {{server.players}}/{{server.max_players}}
          </small>
        </div>


        <div class="col-md-auto d-none d-md-flex cnt">
          <b-input-group-text
            :class="selected ? 'text-white' : 'text-dark'"
            class="w-100 bg-transparent border-0 text-white cntdesktop">
            {{server.players}}/{{server.max_players}}
          </b-input-group-text>
        </div>
        <div class="col-md text-nowrap text-truncate">
          <b-input-group-text
            class="w-100 text-dark text-truncate">
            {{server.name}}
          </b-input-group-text>
        </div>
        <div class="col-6 d-none d-md-flex col-md-auto">
          <b-input-group-text
            :class="selected ? 'text-white' : 'text-dark'"
            class="w-100 bg-transparent text-truncate border-0">
            {{server.map}}
          </b-input-group-text>
        </div>
        <div class="col-md-auto d-none d-md-flex addr">
          <b-btn class="w-100 bg-success text-white addrdesktop">
            {{server.dedicated ? '↪' : ''}}{{server.addr}}
          </b-btn>
        </div>


      </div>

      <span @click.stop>
        <players
          v-if="selected"
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
  border-bottom-style: solid;
}
.dropped {
  box-shadow: inset -2px -3px 78px -4px rgba(0,0,0,0.93);
}
.card-body {
  padding: 0.5rem;
}
.addrdesktop {
  max-width: 13rem;
  min-width: 13rem;
}
.cntdesktop {
  max-width: 3rem;
  min-width: 3rem;
}
</style>
