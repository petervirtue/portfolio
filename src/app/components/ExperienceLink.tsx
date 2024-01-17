import Image from "next/image";
import Link from "next/link";
import { PropsWithChildren } from "react";

interface ExperienceLinkProps extends PropsWithChildren {
  href: string;
  imageSrc: string;
  imageAlt: string;
}

const ExperienceLink = ({
  children,
  href,
  imageSrc,
  imageAlt,
}: ExperienceLinkProps) => {
  return (
    <Link
      target="_blank"
      href={href}
      className="inline-block px-1 duration-200 rounded bg-slate-800 hover:bg-slate-600 border border-slate-500 text-white text-md"
    >
      <span className="flex flex-row items-center justify-center">
        <Image
          className="inline-block rounded mr-1"
          src={imageSrc}
          alt={imageAlt}
          width={14}
          height={14}
        />
        {children}
      </span>
    </Link>
  );
};

export default ExperienceLink;
