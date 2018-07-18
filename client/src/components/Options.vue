<template>
  <div class="p-0 my-0 input-group">
    <game-select />
    <map-select />
  </div>
</template>

<script>
import GameSelect from '@/components/options/GameSelect'
import MapSelect from '@/components/options/MapSelect'

export default {
  components: {
    GameSelect,
    MapSelect
  }
}
</script>
