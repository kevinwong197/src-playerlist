<template>
  <b-navbar-brand>
    <span class="desktop">MasterBrowser: </span>
    {{name}}
  </b-navbar-brand>
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

<style scoped>
.desktop {
  display: none;
}
@media (min-width: 768px) {
  .desktop {
    display: unset;
  }
}
</style>