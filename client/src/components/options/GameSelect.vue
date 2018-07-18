<template>
  <div class="input-group-prepend">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown">
      Type: {{name}}
    </button>
    <div class="dropdown-menu">
      <div class="dropdown-header">game</div>
      <game-type name="TF2" dirname="tf"/>
      <game-type name="CSGO" dirname="csgo"/>
      <game-type name="HL2DM" dirname="hl2mp"/>
      <game-type name="CSS" dirname="cstrike"/>
      <div role="separator" class="dropdown-divider"></div>
      <div class="dropdown-header">mod</div>
      <game-type name="synergy" dirname="synergy"/>
      <game-type name="obsidian" dirname="obsidian"/>
    </div>
  </div>
</template>

<script>
import eventBus from '@/services/eventBus'
import GameType from '@/components/options/gameselect/GameType'

export default {
  data () {
    return {
      name: ''
    }
  },
  mounted () {
    eventBus.$on('updategamelabel', (name) => {
      this.name = name
    })
  },
  components: {
    GameType
  }
}
</script>

<style scoped>
</style>
