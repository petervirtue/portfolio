import Image from "next/image";
import Link from "next/link";

export const About = () => {
  return (
    <div className="flex flex-col items-start">
      <h1 className="my-5 text-xl font-semibold text-slate-50">
        Hi, I&apos;m Peter 👋
      </h1>
      <p className="my-5 text-md text-slate-300">
        <span className="mr-1">
          I&apos;m a software engineer dedicated to crafting intuitive digital
          experiences and innovative solutions. I currently work at
        </span>
        <Link
          target="_blank"
          href="https://foliahealth.com"
          className="inline-block px-1 duration-200 rounded bg-slate-800 hover:bg-slate-600 border border-slate-500 text-white text-md"
        >
          <span className="flex flex-row items-center justify-center">
            <Image
              className="inline-block rounded mr-1"
              src="/folia.png"
              alt="Folia Health Logo"
              width={14}
              height={14}
            />
            Folia Health
          </span>
        </Link>
        <span>
          , where I lead efforts in building cloud infrastructure and designing
          efficient APIs while fostering team growth and enhancing
          relationships.
        </span>
      </p>
    </div>
  );
};
