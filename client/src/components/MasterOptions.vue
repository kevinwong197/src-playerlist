<template>
  <div class="p-0 mt-2 my-0 input-group">
    <game-select />
    <map-select />
  </div>
</template>

<script>
import GameSelect from '@/components/MasterOptions/GameSelect'
import MapSelect from '@/components/MasterOptions/MapSelect'

export default {
  mounted () {
    // eventBus.$on('getservers', game => {
    //   this.getservers(game)
    // })
  },
  components: {
    GameSelect,
    MapSelect
  }
}
</script>
