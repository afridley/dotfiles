`(?<=className=["'][^"']*)([0-9a-zA-Z_-]+\s*)(?=[^"']*["'])`

            onClick={(e) => {
              e.preventDefault()
              sendIt({
                event: 'nav_click',
                eventParams: {
                  nav_item: menuItem.name,
                  nav_type: 'account',
                },
              })
              if (menuItem.onClick) {
                menuItem.onClick(e)
              }

              router.push(menuItem.href)
            }}
---

          onClick={(e) => {
            e.preventDefault()
            sendIt({
              event: 'nav_click',
              eventParams: {
                nav_item: `Pets: Pet ${index + 1}`,
                nav_type: 'account',
              },
            })

            router.push(childItem.href)
          }}
