<template>
  <div class="input-group-prepend dropright">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown">
      Type: {{name}}
    </button>
    <div class="dropdown-menu">
      <div class="dropdown-header">game</div>
      <game-type name="TF2" dirname="tf"/>
      <game-type name="HL2DM" dirname="hl2mp"/>
      <game-type name="CSS" dirname="cstrike"/>
      <game-type name="CS:GO" dirname="CSGO"/>
      <game-type name="GMOD" dirname="garrysmod"/>
      <game-type name="L4D" dirname="left4dead"/>
      <game-type name="L4D2" dirname="left4dead2"/>
      <game-type name="PORTAL2" dirname="portal2"/>
      <div role="separator" class="dropdown-divider"></div>
      <div class="dropdown-header">mod</div>
      <game-type name="gmod9" dirname="gmod9"/>
      <game-type name="synergy" dirname="synergy"/>
      <game-type name="obsidian" dirname="obsidian"/>
      <game-type name="contagion" dirname="contagion"/>
      <game-type name="zombie panic source" dirname="zps"/>
      <game-type name="insurgency" dirname="insurgency"/>
      <game-type name="no more room in hell" dirname="nmrih"/>
      <game-type name="fistful of frag" dirname="fof"/>
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
