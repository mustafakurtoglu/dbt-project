with
    count_of_download_by_app as (

        select a.app_name, i.country_id, count(distinct i.install_id) as install_count
        from `flowing-gasket-438516-q2.mobile_app_sample_dataset.installs` i
        left join
            `flowing-gasket-438516-q2.mobile_app_sample_dataset.dimApps` a
            on i.app_id = a.app_id
        group by 1, 2

    ),
    count_of_download_by_country as (
        select c.country_name, i.app_name, i.install_count
        from count_of_download_by_app i
        left join
            `flowing-gasket-438516-q2.mobile_app_sample_dataset.dimCountry` c
            on i.country_id = c.country_id

    )

select *
from count_of_download_by_country
