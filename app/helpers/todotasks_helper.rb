module TodotasksHelper
  def todotask_status(status)
    t("views.status_schedule.#{status}")
    # case status
    #   when "upcoming"
    #     t('views.status_schedule.upcoming')
    #   when "processing"
    #     t('views.status_schedule.processing')
    #   when "solved"
    #     t('views.status_schedule.solved')
    # end
  end

  def todotask_prioirty(prioirty)
    t("views.priority_lv.#{prioirty}")
    # case prioirty
    #   when "low"
    #     t('views.priority_lv.low')
    #   when "basic"
    #     t('views.priority_lv.basic')
    #   when "high"
    #     t('views.priority_lv.high')
    # end
  end

  def enum_status
    [
      [t('views.status_schedule.upcoming'), 1], 
      [t('views.status_schedule.processing'), 2], 
      [t('views.status_schedule.solved'), 3]
    ]
  end

  def sorting_i18n(sorting)
    s = sorting.to_s;
    t("views.todotasks.#{s}")
  end
end