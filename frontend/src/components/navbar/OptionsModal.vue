<template>
  <b-modal id="options" title="Options" @ok="update">
    <div>
      <b-form-group>
        <b-form-checkbox-group stacked v-model="selected" :options="options">
        </b-form-checkbox-group>
      </b-form-group>
    </div>
  </b-modal>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      selected: [],
      options: [
        {text: 'Show Empty Servers', value: 'empty'},
        {text: 'Show Local Servers', value: 'local'}
      ]
    }
  },
  methods: {
    update () {
      this.options.forEach(item => {
        eventBus.$emit(`update${item.value}`, this.selected.includes(item.value))
      })
    }
  }
}
</script>
