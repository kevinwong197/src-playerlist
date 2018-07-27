<template>
  <b-navbar-brand>MasterBrowser: {{name}}</b-navbar-brand>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      name: ':v'
    }
  },
  mounted () {
    eventBus.$on('updategamelabel', (name) => {
      this.name = name
    })
  }
}
</script>