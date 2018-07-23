<template>
  <b-modal id="cfgmodal" title="Settings">
    <div>
      <b-form-group>
        <b-form-checkbox-group stacked v-model="selected" :options="options">
        </b-form-checkbox-group>
      </b-form-group>
    </div>
  </b-modal>
</template>

<script>
export default {
  data () {
    return {
      selected: [],
      options: [
        {text: 'Show Empty Servers', value: 'empty'},
        {text: 'Show Local Servers', value: 'local'}
      ]
    }
  }
}
</script>
