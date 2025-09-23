```ts
import * as React from "react";

export const ScrollbarWidthContext = React.createContext<number>(0);

/**
 * Provides the width of the scrollbar
 **/
export const useScrollbarWidth = () => React.useContext(ScrollbarWidthContext);
export function ScrollbarWidthProvider({
	children,
}: {
	children: React.ReactNode;
}) {
	const [scrollbarWidth, setScrollbarWidth] = React.useState(0);

	const calcScrollWidth = React.useCallback(() => {
		
		const isScrollbarVisible =
			document.documentElement.scrollHeight > window.innerHeight;

		if (isScrollbarVisible) {
			const temp = document.createElement("div");
			temp.style.visibility = "hidden";
			temp.style.overflow = "scroll";
			temp.style.width = "100px";
			temp.style.height = "100px";
			temp.style.position = "absolute";
			temp.style.top = "0";

			document.body.appendChild(temp);

			const innerTemp = document.createElement("div");
			innerTemp.style.width = "100%";
			temp.appendChild(innerTemp);

			const width = temp.offsetWidth - innerTemp.offsetWidth;

			if (width !== scrollbarWidth) {
				setScrollbarWidth(width);
			}
		} else {
			setScrollbarWidth(0);
		}

		// eslint-disable-next-line react-hooks/exhaustive-deps
	}, []);

	React.useEffect(() => {
		calcScrollWidth();

		const ro = new ResizeObserver(calcScrollWidth);
		ro.observe(document.documentElement);

		return () => {
			ro.disconnect();
		};
	}, [calcScrollWidth]);

	return (
		<ScrollbarWidthContext.Provider value={scrollbarWidth}>
			{children}
		</ScrollbarWidthContext.Provider>
	);
}

```