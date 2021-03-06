import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['task']

  connect() {
    super.connect()
  }

  reflexSuccess(element, reflex, noop, reflexId) {
    this.flash('Hooray!', `Successfully deleted a task!`, 'success')
  }

  delete_task() {
    this.stimulate('Task#delete', this.taskTarget.dataset.tid)
  }

}
