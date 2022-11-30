import 'package:master_plan/models/plan.dart';
import 'package:master_plan/models/task.dart';
import 'package:master_plan/repositories/in_memory_cache.dart';
import 'package:master_plan/repositories/repository.dart';

class PlanServices {
  final Repository _repository = InMemoryCache();

  Plan createPlan(String name) {
    final model = _repository.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }

  void savePlan(Plan plan) {
    _repository.update(plan.toModel());
  }

  void delete(Plan plan) {
    _repository.delete(plan.toModel());
  }

  List<Plan> getAllPlans() {
    final allPlans = _repository
        .getAll()
        .map<Plan>((model) => Plan.fromModel(model))
        .toList();
    return allPlans;
  }

  void addTask(Plan plan, String description) {
    final id = plan.tasks.isEmpty ? 1 : plan.tasks.last.id + 1;
    final task = Task(id: id, description: description);
    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
    savePlan(plan);
  }
}
