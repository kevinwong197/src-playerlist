<template>
  <b-dd id="ddown-right" :text="'Game Type: ' + name" variant="success" slot="append">
    <b-dd-header>game</b-dd-header>
    <game-type name="TF2" dirname="tf"/>
    <game-type name="HL2DM" dirname="hl2mp"/>
    <game-type name="CSS" dirname="cstrike"/>
    <game-type name="CS:GO" dirname="CSGO"/>
    <game-type name="GMOD" dirname="garrysmod"/>
    <game-type name="L4D" dirname="left4dead"/>
    <game-type name="L4D2" dirname="left4dead2"/>
    <game-type name="PORTAL2" dirname="portal2"/>
    <b-dd-divider />
    <b-dd-header>mod</b-dd-header>
    <game-type name="gmod9" dirname="gmod9"/>
    <game-type name="synergy" dirname="synergy"/>
    <game-type name="obsidian" dirname="obsidian"/>
    <game-type name="contagion" dirname="contagion"/>
    <game-type name="zombie panic source" dirname="zps"/>
    <game-type name="insurgency" dirname="insurgency"/>
    <game-type name="no more room in hell" dirname="nmrih"/>
    <game-type name="fistful of frag" dirname="fof"/>
  </b-dd>
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
