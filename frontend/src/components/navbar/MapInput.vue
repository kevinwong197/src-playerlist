<template>
  <b-form-input v-model="map"
    type="text"
    placeholder="Map Name"
    @input="loadmap"></b-form-input>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      map: ''
    }
  },
  methods: {
    loadmap (map) {
      eventBus.$emit('updatemap', map)
    }
  }
}
</script>
