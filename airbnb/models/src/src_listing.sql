WITH
    raw_listings AS (
        SELECT
            *
        FROM
            {{ source('raw', 'listings') }}
    ),
    renamed as (
        select
            ID as listing_id,
            LISTING_URL,
            NAME as listing_name,
            ROOM_TYPE,
            MINIMUM_NIGHTS,
            HOST_ID,
            PRICE as price_str,
            CREATED_AT,
            UPDATED_AT
        from
            raw_listings
    ) (
        select
            *
        from
            renamed
    )

    