<template>
  <div class="input-group-prepend">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown">type</button>
    <div class="dropdown-menu">
      <div class="dropdown-header">game</div>
      <a class="dropdown-item" href="#" @click="loadgame('tf')">TF2</a>
      <a class="dropdown-item" href="#" @click="loadgame('csgo')">CSGO</a>
      <a class="dropdown-item" href="#" @click="loadgame('hl2mp')">HL2DM</a>
      <a class="dropdown-item" href="#" @click="loadgame('cstrike')">CSS</a>
      <div role="separator" class="dropdown-divider"></div>
      <div class="dropdown-header">mod</div>
      <a class="dropdown-item" href="#" @click="loadgame('synergy')">synergy</a>
      <a class="dropdown-item" href="#" @click="loadgame('obsidian')">obsidian</a>
    </div>
  </div>
</template>

<script>
import eventBus from '@/services/eventBus.js'

export default {
  methods: {
    loadgame (game) {
      eventBus.$emit('updategame', game)
      eventBus.$emit('getservers')
    }
  }
}
</script>

<style scoped>
</style>
